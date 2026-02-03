package automation;

import com.intuit.karate.junit5.Karate;

class RunnerTest {
  @Karate.Test
  Karate runUi() {
    return Karate.run("classpath:features/ui").relativeTo(getClass());
  }
}
