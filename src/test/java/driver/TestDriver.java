package driver;

import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;

import org.testng.annotations.Parameters;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.AfterTest;

public class TestDriver {

	public WebDriver driver;
	
	public String appUrl;
	
	@BeforeTest
	@Parameters({"browser"})
	public void setUpDriver(String browser) throws MalformedURLException {
		
		// TODO Move entire URL out to the dockerenvvars.bat/.sh env setting script
		this.appUrl = "http://" + System.getenv("APP_IP") + ":9191";
		String completeURL = "http://" + System.getenv("GRID_URL") +":4444/wd/hub";

		if (browser.equalsIgnoreCase("chrome")) {
			ChromeOptions options = new ChromeOptions();
			this.driver = new RemoteWebDriver(new URL(completeURL), options);
		} else if (browser.equalsIgnoreCase("firefox")) {
			FirefoxOptions options = new FirefoxOptions();
			this.driver = new RemoteWebDriver(new URL(completeURL), options);
		}	
	}
	
	@AfterTest
	public void quitDriver() {
		this.driver.quit();	
	}
	
}
