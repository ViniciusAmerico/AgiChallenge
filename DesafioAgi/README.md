************************ TESTE Einstein Bot ******************************
- Logar, ir para o Setup e procurar no Quick Find por Einstein Bot.
- Acessar o bot AgiBot.
- No canto superior direito, clicar em Preview e iniciar a conversa com o bot.

************************ Introdução ************************
- Ao acessar a primeira opção relativa ao Status, se for inserido o número 123456, a API irá bater no Beeceptor (Mock) e retornará o status com base nesse "código".
- Qualquer outro valor retornará Não Encontrado.

************************ Melhorias ************************
- Ajustar o bot para evitar loops de conversa.
- Fazer a concatenação dos campos First Name e Last Name para gerar o Full Name, perguntando apenas uma vez o nome ao cliente.
- Aplicar Regex nos campos de E-mail, Telefone e Número do Pedido, permitindo que o usuário corrija caso insira informações incorretas.
- Configuração do Omni-Channel, filas e permissões para possibilitar que o operador receba, junto ao Case, o LiveChatTranscript, atendendo o cliente em tempo real.
- Implantar classes Swagger para melhor tratamento das respostas retornadas pela API.
- Criar campos de Custom Metadata para armazenamento de variáveis de acesso da API.
- Adaptação para utilização de OAuth2 em conjunto com os metadados.
- Criar uma tela de visualização dentro do Salesforce para exibição de erros, com envio de e-mail automático para o usuário definido via metadado.
- Inserção de emojis para tornar a conversa com o bot mais acolhedora.
- Implementar programação defensiva para capturar erros antes que cheguem à API, incluindo validações em controller, helper, etc.
- Tratamento de erro amigável nos Flows, evitando mensagens técnicas ou confusas para o usuário.
- Adequar as classes para promover a reutilização, transformando-as em genéricas.
- Adaptar métodos para receberem Mapas de parâmetros, possibilitando o processamento de múltiplos registros (mesmo que o cenário atual envolva apenas testes individuais).
- Programação defensiva nos Flows, tratando a ausência de campos obrigatórios.
- Implementar identificação de cliente: caso já exista cadastro, o Case será aberto vinculado à conta existente.
- Melhorar a classe MockHttpResponseGenerator, tornando as respostas mais assertivas para os testes.
- Aumentar a cobertura dos testes utilizando classes Factory, como para criação de BotRequest, otimizando testes futuros.
- Melhorar os asserts nos testes, visando Stress Tests ao invés de validações superficiais.
- Aprimorar os logs de erro do Apex para retornos mais informativos.

************************ Metodologias Utilizadas ************************
- SOLID (separação de Controller, Helper, Service e definição de Generators para reutilização)
  - Obs.: A inclusão do Helper foi apenas para fins demonstrativos e para reforçar a adoção de padrões.
- Clean Code (uso de nomenclaturas claras nas variáveis e padrões de desenvolvimento como lLst, lMap, a, etc.)
- Given-When-Then (estrutura utilizada na classe de testes)
