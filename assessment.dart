// Criando um Assessment
Assessment assessment = new Assessment();
assessment.id = 'A001';
assessment.Name = 'Avaliação de Exemplo';
assessment.AssessmentStatus = 'In Progress';
assessment.IsSavedForLater = false;
assessment.IsSuggestedAssessment = false;

// Criando perguntas e respostas

// Pergunta 1
AssessmentQuestion question1 = new AssessmentQuestion();
question1.id = 'Q001';
question1.questionText = 'Você gosta de gatos?';
question1.questionType = 'sim/não';
question1.optionScores = new Map<String, Decimal>{'sim' => 0.2, 'não' => 0.0};

// Pergunta 2
AssessmentQuestion question2 = new AssessmentQuestion();
question2.id = 'Q002';
question2.questionText = 'Você tem carros?';
question2.questionType = 'sim/não';
question2.optionScores = new Map<String, Decimal>{'sim' => 0.5, 'não' => 0.0};

// Pergunta 3
AssessmentQuestion question3 = new AssessmentQuestion();
question3.id = 'Q003';
question3.questionText = 'Qual seu esporte favorito?';
question3.questionType = 'múltipla escolha';
question3.options = new List<String>{'a - futebol', 'b - basquete', 'c - volei', 'd - handbol'};
question3.optionScores = new Map<String, Decimal>{'a' => 1.0, 'b' => 1.3, 'c' => 2.6, 'd' => 3.0};

// Pergunta 4
AssessmentQuestion question4 = new AssessmentQuestion();
question4.id = 'Q004';
question4.questionText = 'Qual meta das opções abaixo você está mais engajado?';
question4.questionType = 'múltipla escolha';
question4.options = new List<String>{'a - energia', 'b - transporte', 'c - água', 'd - funcionários'};
question4.optionScores = new Map<String, Decimal>{'a' => 0.2, 'b' => 0.3, 'c' => 0.6, 'd' => 0.4};

// Pergunta 5
AssessmentQuestion question5 = new AssessmentQuestion();
question5.id = 'Q005';
question5.questionText = 'Quais livros abaixo você já leu?';
question5.questionType = 'checkbox';
question5.options = new List<String>{'a pedra filosofal', 'o gato comeu', 'minha mãe é uma peça', 'feliz ano velho'};
question5.optionScores = new Map<String, Decimal>{'a pedra filosofal' => 0.2, 'o gato comeu' => 0.8, 'minha mãe é uma peça' => 0.9, 'feliz ano velho' => 0.1};

// Pergunta 6
AssessmentQuestion question6 = new AssessmentQuestion();
question6.id = 'Q006';
question6.questionText = 'Quais filmes abaixo você já viu?';
question6.questionType = 'checkbox';
question6.options = new List<String>{'os normais', 'as branquelas', 'se eu fosse você'};
question6.optionScores = new Map<String, Decimal>{'os normais' => 0.1, 'as branquelas' => 0.3, 'se eu fosse você' => 0.4};

// Respostas do candidato
AssessmentQuestionResponse response1 = new AssessmentQuestionResponse();
response1.id = 'R001';
response1.assessmentId = assessment.id;
response1.questionId = question1.id;
response1.candidateResponse = 'sim';
response1.score = question1.optionScores.get('sim');

AssessmentQuestionResponse response2 = new AssessmentQuestionResponse();
response2.id = 'R002';
response2.assessmentId = assessment.id;
response2.questionId = question2.id;
response2.candidateResponse = 'sim';
response2.score = question2.optionScores.get('sim');

AssessmentQuestionResponse response3 = new AssessmentQuestionResponse();
response3.id = 'R003';
response3.assessmentId = assessment.id;
response3.questionId = question3.id;
response3.candidateResponse = 'c - volei';
response3.score = question3.optionScores.get('c - volei');

AssessmentQuestionResponse response4 = new AssessmentQuestionResponse();
response4.id = 'R004';
response4.assessmentId = assessment.id;
response4.questionId = question4.id;
response4.candidateResponse = 'b - transporte';
response4.score = question4.optionScores.get('b - transporte');

AssessmentQuestionResponse response5 = new AssessmentQuestionResponse();
response5.id = 'R005';
response5.assessmentId = assessment.id;
response5.questionId = question5.id;
response5.candidateResponse = 'a pedra filosofal, o gato comeu';
response5.score = question5.optionScores.get('a pedra filosofal') + question5.optionScores.get('o gato comeu');

AssessmentQuestionResponse response6 = new AssessmentQuestionResponse();
response6.id = 'R006';
response6.assessmentId = assessment.id;
response6.questionId = question6.id;
response6.candidateResponse = 'as branquelas, se eu fosse você';
response6.score = question6.optionScores.get('as branquelas') + question6.optionScores.get('se eu fosse você');

// Criando um conjunto de perguntas (opcional)
AssessmentQuestionSet questionSet = new AssessmentQuestionSet();
questionSet.id = 'QS001';
questionSet.name = 'Conjunto de Perguntas de Exemplo';
questionSet.questionIds = new List<Id>{question1.id, question2.id, question3.id, question4.id, question5.id, question6.id};

// Criando versões das perguntas (opcional)
AssessmentQuestionVersion version1 = new AssessmentQuestionVersion();
version1.id = 'QV001';
