import java.nio.file.*;
import java.sql.*;
import java.io.StringReader;
import org.h2.tools.RunScript;

class DatabaseSmokeTest {
    public static void main(String[] args) throws Exception {
        Path base=Path.of(args[0]);
        String kind=args[1];
        try(Connection db=DriverManager.getConnection("jdbc:h2:mem:portfolio;MODE=Oracle", "sa", "")) {
            for(String file : new String[]{"01_schema.sql", "02_dados_demo.sql", "03_consultas.sql"}) {
                RunScript.execute(db, new StringReader(Files.readString(base.resolve(file))));
            }
            if(kind.equals("fiap")) {
                scalar(db,"SELECT SUM(consumo_kwh) FROM consumo_energia",10.3);
                reject(db,"INSERT INTO consumo_energia VALUES (99,1,CURRENT_TIMESTAMP,-1)");
                reject(db,"INSERT INTO consumo_energia VALUES (99,999,CURRENT_TIMESTAMP,1)");
                db.createStatement().execute("INSERT INTO acao_automatica VALUES (2,2,CURRENT_TIMESTAMP,'Teste')");
                reject(db,"INSERT INTO alerta_acao VALUES (1,2,1)");
            } else {
                scalar(db,"SELECT c.saldo_inicial + SUM(CASE WHEN t.tipo='ENTRADA' THEN t.valor ELSE -t.valor END) FROM conta_financeira c JOIN transacao t ON t.id_conta=c.id_conta GROUP BY c.saldo_inicial",3120);
                reject(db,"INSERT INTO transacao VALUES (99,1,'INVALID','Teste','Teste',1,CURRENT_DATE)");
                reject(db,"INSERT INTO transacao VALUES (99,1,'SAIDA','Teste','Teste',-1,CURRENT_DATE)");
                reject(db,"INSERT INTO conta_financeira VALUES (99,999,'Teste','Corrente',0)");
            }
        }
        System.out.println("OK: schema, dados, consultas e restricoes (H2 em modo Oracle; nao equivale a Oracle real)");
    }
    static void scalar(Connection db,String sql,double expected) throws Exception {
        try(ResultSet r=db.createStatement().executeQuery(sql)) {
            if(!r.next() || Math.abs(r.getDouble(1)-expected)>0.00001)throw new AssertionError("Resultado incorreto");
        }
    }
    static void reject(Connection db,String sql) throws Exception {
        try { db.createStatement().execute(sql); }
        catch(SQLException expected) {
            if(expected.getSQLState().startsWith("23"))return;
            throw expected;
        }
        throw new AssertionError("Restricao nao aplicada: "+sql);
    }
}
