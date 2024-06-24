@isTest
public class CalculoQuestionarioTest {
    @isTest
    static void testTotal() {
        
        Map<String, String> scoreVersion = new Map<String, String>();

        for (Integer i = 1; i <= 12; i++){

            if (i <= 12) {
                scoreVersion.put('Test ' + i, 'sim\nnão');
            }

            if (i > 12 && i <= 20) {
                scoreVersion.put('Test ' + i, 'a\nb\nc');
            }

            if (i > 20 && i <= 35) {
                scoreVersion.put('Test ' + i, 'a\nb\nc\nd\ne');
            }
        }
        
        Map<String, String> scoreResponse = new Map<String, String>();

        scoreResponse.put('Test 1', '0.3');
        scoreResponse.put('Test 2', '0.3');
        scoreResponse.put('Test 3', '0.3');
        scoreResponse.put('Test 4', '0.3');
        scoreResponse.put('Test 5', '0.3');
        scoreResponse.put('Test 6', '0.3');
        scoreResponse.put('Test 7', '0.3');
        scoreResponse.put('Test 8', '0.3');
        scoreResponse.put('Test 9', '0.3');
        scoreResponse.put('Test 10', '0.3');
        scoreResponse.put('Test 11', '0.3');
        scoreResponse.put('Test 12', '0.3');
        scoreResponse.put('Test 13', '0.3');
        scoreResponse.put('Test 14', '0.3');
        scoreResponse.put('Test 15', '0.3');
        scoreResponse.put('Test 16', '0.3');
        scoreResponse.put('Test 17', '0.3');
        scoreResponse.put('Test 18', '0.3');
        scoreResponse.put('Test 19', '0.3');
        scoreResponse.put('Test 20', '0.3');
        scoreResponse.put('Test 21', '0.3');
        scoreResponse.put('Test 22', '0.3');
        scoreResponse.put('Test 23', '0.3');
        scoreResponse.put('Test 24', '0.3');
        scoreResponse.put('Test 25', '0.3');
        scoreResponse.put('Test 26', '0.3');
        scoreResponse.put('Test 27', '0.3');
        scoreResponse.put('Test 28', '0.3');
        scoreResponse.put('Test 29', '0.3');
        scoreResponse.put('Test 30', '0.3');
        scoreResponse.put('Test 31', '0.2');
        scoreResponse.put('Test 32', '0.2');
        scoreResponse.put('Test 33', '0.2');
        scoreResponse.put('Test 34', '0.2');
        scoreResponse.put('Test 35', '0.2');
        
        Assessment__c ass = new Assessment__c(Name = 'Test Assessment');
        insert ass;
        
        List<AssessmentQuestionVersion__c> versions = ObterVersoes(scoreVersion);

        List<AssessmentQuestionResponse__c> questionResponses = ObterResponse(ass, versions, scoreResponse, System.today());

        // Instancia a classe CalculoQuestionario
        CalculoQuestionario calculo = new CalculoQuestionario();
        
        // Chama o método Total e armazena o resultado
        Test.startTest();
        Decimal result = calculo.Total();
        Test.stopTest();
        // Verifica se o resultado é o esperado (10 + 20 + 30 = 60)
        System.assertEquals(10, result, 'O cálculo do total está incorreto');
    }

    static List<AssessmentQuestionResponse__c> ObterResponse(Assessment__c ass, List<AssessmentQuestionVersion__c> versions, Map<String, String> opcoes, Date createdDate){

        List<AssessmentQuestionResponse__c> questionResponse = new List<AssessmentQuestionResponse__c>();

        for (Integer i = 1; i <= opcoes.size(); i++){
            for (AssessmentQuestionVersion__c version : versions) {
                if (version.Name == 'Test ' + i) {
                    AssessmentQuestionResponse__c response = new AssessmentQuestionResponse__c
                    (Name = 'Test ' + i, Assessment__c = ass.Id, Response_Value_Score__c = Decimal.valueOf(opcoes.get(version.Name)), CreatedDate__c = createdDate);
                    questionResponse.add(response);
                }
            }
        }

        insert questionResponse;

        return questionResponse;
    }


    static List<AssessmentQuestionVersion__c> ObterVersoes(Map<String, String> opcoes){        
        
        List<AssessmentQuestion__c> questions = new List<AssessmentQuestion__c>();
        
        for (Integer i = 1; i <= 35; i++){
            AssessmentQuestion__c question = new AssessmentQuestion__c(Name = 'Test ' + i);
            questions.add(question);
        }
        
        insert questions;
        
        List<AssessmentQuestionAssigningment__c> assigs = new List<AssessmentQuestionAssigningment__c>();
        
        for (Integer i = 1; i <= 35; i++){
            for (AssessmentQuestion__c question : questions) {
                if (question.Name == 'Test ' + i) {
                    AssessmentQuestionAssigningment__c assig1 = new AssessmentQuestionAssigningment__c
                        (Name = 'Test ' + i, Order__c = '2.' + i, AssessmentQuestion__c = question.Id);
                    assigs.add(assig1);
                }
            }            
        }
        
        insert assigs;
        
        List<AssessmentQuestionVersion__c> versions = new List<AssessmentQuestionVersion__c>();
        
        for (Integer i = 1; i <= 35; i++){
            for (AssessmentQuestion__c question : questions){
                if (question.Name == 'Test ' + i) {
                AssessmentQuestionVersion__c version = new AssessmentQuestionVersion__c
                (Name = 'Test ' + i, AssessmentQuestionId__c = question.Id, Response_Value_Score__c = opcoes.get(question.Name));
            	versions.add(version);
                }
            }
        }
        
        insert versions;

        return versions;
    }
}