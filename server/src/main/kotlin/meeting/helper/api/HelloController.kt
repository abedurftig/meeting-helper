package meeting.helper.api

import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get

@Controller("/api/v1/hello")
class HelloController {

    @Get
    fun getMessage() = "Hello World!!"
}
