import com.intuit.karate.junit5.Karate;

public class KarateRunner2 {
    @Karate.Test
    Karate runTest() {
//        String filePath = System.getProperty("karate.test");
//        if (filePath == null || filePath.isEmpty()) {
//            throw new IllegalArgumentException("Error");
//        }
//        String fileName = filePath.replace('\\', '/');
//        return Karate.run(fileName).relativeTo(KarateRunner2.class);
        return Karate.run("testcases/orangehrm/TC_002").relativeTo(KarateRunner2.class);
    }
}
