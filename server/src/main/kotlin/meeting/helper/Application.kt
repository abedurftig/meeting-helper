package meeting.helper

import io.micronaut.runtime.Micronaut

class App {
    val greeting: String
        get() {
            return "Hello World!"
        }
}

object Application {

    @JvmStatic
    fun main(args: Array<String>) {
        Micronaut.build()
                .packages("meeting.helper")
                .mainClass(Application.javaClass)
                .start()
    }
}