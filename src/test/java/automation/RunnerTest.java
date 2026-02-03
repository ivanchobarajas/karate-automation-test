package automation;

import com.intuit.karate.testng.KarateRunner;
import java.util.Arrays;
import java.util.List;
import org.testng.annotations.Test;

public class RunnerTest extends KarateRunner {
  @Override
  public List<String> getFeaturePaths() {
    return Arrays.asList("classpath:features/ui");
  }

  @Test
  public void testAll() {
    run();
  }
}

