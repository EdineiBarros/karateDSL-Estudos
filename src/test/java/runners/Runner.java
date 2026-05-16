package runners;

import com.intuit.karate.junit5.Karate;

class Runner {

    @Karate.Test
    Karate runAll() {
        return Karate.run("classpath:features")
                .tags("@rodar");
    }
}
/*Rodar por tag*/
//Karate runAll() {
//        return Karate.run("classpath:features")
//                .tags("@rodar");

/*rodar uma ou mais features*/
//Karate runAll() {
//    return Karate.run(
//            "classpath:features/getUser.feature",
//            "classpath:features/getUserMatch.feature");

/*rodar tudo que está na pasta features*/
//Karate runAll() {
//        return Karate.run("classpath:features");