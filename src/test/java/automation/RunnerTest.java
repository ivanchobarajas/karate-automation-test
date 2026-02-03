package automation;

import com.intuit.karate.junit5.Karate;

class RunnerTest {
  @Karate.Test
  Karate testUi() {
    return Karate.run("classpath:features/ui/login.feature");
  }
}
