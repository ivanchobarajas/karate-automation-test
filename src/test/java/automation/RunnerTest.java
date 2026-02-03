package automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.testng.annotations.Test;
import static org.testng.Assert.assertEquals;

public class RunnerTest {

    @Test
    public void testAll() {
        Results results = Runner.path("classpath:features/ui")
                .tags("~@ignore")
                .outputCucumberJson(true)
                .parallel(1);
        
        // Mostrar resultados detallados
        System.out.println("========================================");
        System.out.println("Tests ejecutados: " + results.getFeaturesTotal());
        System.out.println("Scenarios pasados: " + results.getScenariosPassed());
        System.out.println("Scenarios fallidos: " + results.getFailCount());
        System.out.println("========================================");
        
        if (results.getFailCount() > 0) {
            System.out.println("ERRORES:");
            System.out.println(results.getErrorMessages());
        }
        
        assertEquals(results.getFailCount(), 0, 
            "Hay tests fallidos: " + results.getErrorMessages());
    }
}

