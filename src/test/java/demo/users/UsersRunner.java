package demo.users;

import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@CucumberOptions(features = "classpath:demo/users/transactions.feature")
public class UsersRunner {

}