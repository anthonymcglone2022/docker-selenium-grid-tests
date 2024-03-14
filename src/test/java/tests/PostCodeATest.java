package tests;

import java.time.Duration;

import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.By;

import org.testng.annotations.*;

import driver.TestDriver;

public class PostCodeATest extends TestDriver {
	
	@Test
	public void runTest() throws InterruptedException {
	    driver.get(appUrl + "/checkViaDatabase/W5 1AT");
	
	    new WebDriverWait(driver, Duration.ofMillis(5000)).until(
	        ExpectedConditions.visibilityOf(driver.findElement(
		        By.xpath("//body")
		    )
	        )
	    );
	
	    driver.findElements(
	        By.xpath("//*[contains(text(), \'W5 1AT\')]")
	    );	
	}
}
