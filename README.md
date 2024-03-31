
# Casos de teste de mangás interativos implementados usando MangaSticker

### Autor: Vitor de Almeida Silva, PUC-GO/TCC - 2020

### Breve explicação

O presente repositório contem os arquivos dos três casos de testes de mangás interativos desenvolvidos durante meu TCC.  Os projetos têm o objetivo de servirem como ferramentas para treinamento de pessoas com Síndrome de Down em habilidades simples de manipulação de dinheiro. 

Pessoas com essa condição genética apresentam caracetísticas específicas, que exigem uma abordagem diferente nos treinamentos. Mais detalhes foram relatados no artigo publicado sobre o projeto:
- [MangaSticker: A Tool To Build Interactive Manga](https://ijcaonline.org/archives/volume174/number11/31723-2021920989/)

### Como estão organizados:

São três casos de testes separados por pastas individuais, podem ser entendidos como projetos diferentes. Salvo o caso de teste 0, que não usa microcontrolador, os projetos cotém os seguintes elementos:
- **Código fonte:** é o código-fonte produzido no [Processing IDE](https://processing.org/download). Consiste da sequência de acionamentos necessário para o mangá interativo, inclusive, se integra ao Arduino, que possibilita a comunicação entre o mangá e o sistema que reproduz a lógica. 
	- O Arduíno é gravado com a lib [Standard Firmata](https://www.arduino.cc/reference/en/libraries/firmata/), que possibilita a comunicação padronizada com qualquer mangá interativo construído seguindo essas convenções.
- **Projeto do MangaSticker:** é o projeto gerado usando o software MangaSticker, um dos produtos dessa pesquisa:
	- O MangaSticker permite editar a interface do mangá interativo, combinando os componentes de circuito, que seguem o padrão de [Circuit Stickers](https://www.media.mit.edu/projects/circuit-stickers/overview/), com os quadros de mangá. A aplicação dá total liberdade criativa para construir interfaces tangíveis usando papel e circuitos, logo, não se limita ao tópico de mangás, mas foi inicialmente desenvolvido com esse foco.
	- O código-fonte do MangaSticker é mantido de forma pública pelos pesquisadores do grupo de TCC no seguinte repositório:
		- [MangaSticker github](https://github.com/Vitor0534/MangaSticker)
- **Simulação do circuito:** para testar o sistema antes de implementar a versão física, foram construídas simulações no software [Proteus v8.2](https://www.labcenter.com/), não é um passo obrigatório, mas é recomendado para evitar gastos desnecessários de tempo e componentes.

### Dependências de desenvolvimento:

Primeiro é necessário certificar-se de que as dependências de sistema e desenvolvimento estão configuradas corretamente:
- Ambiente de desenvolvimento:
	- [Arduino IDE](https://www.arduino.cc/en/software)
	- [Processing IDE](https://processing.org/download)
	- [Proteus](https://www.labcenter.com/): caso seja necessário simular os circuitos
	- [MangaSticker](https://github.com/Vitor0534/MangaSticker): caso seja necessário modelar os mangás interativos
- libs de desenvolvimento:
	- [Firmata:](https://www.arduino.cc/reference/en/libraries/firmata/) o Arduíno deve ser gravado com esse código antes de ser integrado ao sistema
	- [com0com:](https://com0com.sourceforge.net/) simulador de porta serial, necessário para executar as simulações no Proteus

### Como executar os projetos:

Os passos para executar o projeto de um mangá interativo são:

 1. Abra o código-fonte do mangá usando o Processing
 2. Grave o Arduino com a lib Firmata
 3. Organize o circuito do mangá interativo conforme o esquema de conexões juntamente com o Arduino
 4. Conecte o Arduino ao computador via porta USB
 5. Execute o código do Processing

O processo para executar usando o Proteus é o mesmo. Salvo que, nesse caso, é necessário usar o "simulador" de portas seriais. Indique a porta a ser conectada tanto no arduino do Proteus quanto na conexão no código do Processing.


### Sobre os casos de teste

**Caso de teste 0:** 

Foi criado apenas para simulação, ele tem apenas o circuito do Proteus. É o caso mais simples e se baseia na primeira história, com o personagem Gustavo. Contém apenas interações de cliques e luz, sem áudio:


**Caso de teste 1:** 

Gustavo é um garoto que coleciona notas de real, ele convida o interlocutor para aprender um pouco sobre sua coleção. O personagem, por meio de cliques nos quadros do mangá, ensina a pessoa a identificar todas as notas usando estímulos de áudio (falas, músicas) e luz (leds):

![enter image description here](./Caso%20de%20teste%201/Simulacao%20do%20circuito/cena%20principal%202.jpg)


- **Caso de teste 2:** Sara é uma garota que inventa diversas brincadeiras, dessa vez ela monta um tipo de "venda" de brinquedos. O interlocutor entra na brincadeira e utiliza cliques nos quadros para comprar os itens do "mercadinho na sala" que a personagem montou

![enter image description here](./Caso%20de%20teste%202/Simulacao%20do%20circuito/face_Manga.jpg)


### Links que podem matar a curiosidade
- [O que são cirtuit stickers? (1)](https://www.media.mit.edu/projects/circuit-stickers/overview/)
- [O que são circuit sticker exemplo? (2)](https://www.crowdsupply.com/chibitronics/circuit-stickers)
