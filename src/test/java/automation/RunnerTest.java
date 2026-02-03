package automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.testng.Assert.*;
import org.testng.annotations.Test;

public class RunnerTest {

    // Reemplazamos el método de lista por una variable simple para mantener la ruta
    private String featurePath = "classpath:features/ui";

    @Test
    public void testAll() {
        // Runner.path() reemplaza la antigua lógica de herencia
        Results results = Runner.path(featurePath)
                                .outputHtmlReport(true)
                                .parallel(1);
        
        // Validación para que TestNG marque la prueba como fallida si Karate falla
        assertEquals(results.getFailCount(), 0, results.getErrorMessages());
    }
}

