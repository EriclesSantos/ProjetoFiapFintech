# Monk · Landing page de educação financeira

Protótipo acadêmico de uma página de apresentação para uma proposta de educação financeira e investimentos. A interface reúne apresentação da marca, áreas de atuação, galeria e campos de pré-registro.

**Contexto:** projeto de estudo FIAP · **Tipo:** frontend estático · **Estado:** protótipo de interface.

## Interface

Captura real da página servida localmente, usando os arquivos deste repositório.

![Página Monk no navegador](docs/assets/monk-desktop.png)

<details>
<summary>Visualização em tela de celular</summary>

![Página Monk em viewport de 390 pixels](docs/assets/monk-mobile.png)

</details>

## Tecnologias

| Tecnologia | Uso no projeto |
|---|---|
| HTML5 | Estrutura da página e campos de entrada. |
| CSS3 | Cores, seção principal, imagens e organização visual. |
| Bootstrap 5.3.2 | Grade, espaçamento, botões e estilos de formulário. |
| Bootstrap Icons 1.10.5 | Ícones das áreas de atuação. |

Bootstrap e os ícones são carregados por CDN e precisam de acesso à internet para esse carregamento.

## O que a página apresenta

- Cabeçalho com marca e navegação demonstrativa.
- Seção de apresentação da proposta Monk.
- Áreas de cursos, acompanhamento e investimentos.
- Galeria de imagens e campos de pré-registro.
- Rodapé e números ilustrativos do layout.

Os campos e links são parte do protótipo visual. Não há cadastro funcional, acesso a contas, backend ou operações financeiras. Os números exibidos não representam métricas reais de uma empresa.

## Executar localmente

Abra `index.html` no navegador ou sirva a pasta com Python 3:

```sh
python -m http.server 8000
```

Acesse `http://localhost:8000`. Os arquivos de CSS e imagens ficam na raiz do projeto; mantenha essa estrutura ao copiar o site.
