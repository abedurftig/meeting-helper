routes {
  * {
    MainStore.load()
  }
}

record Data {
  message : String
}

enum Status {
  Initial
  Loading
  Error(String)
  Ok(Data)
}

store MainStore {
  state status : Status = Status::Initial

  fun load : Promise(Never, Void) {
    sequence {
      next { status = Status::Loading }

      response =
        @API_ENDPOINT + "hello"
        |> Http.get()
        |> Http.send()

      object =
        response.body

      result =
        Data(object)

      next { status = Status::Ok(result) }
    } catch Http.ErrorResponse => error {
      next { status = Status::Error("Something went wrong with the request.") }
    }
  }
}

component Main {
  connect MainStore exposing { status }

  style app {
    justify-content: center;
    flex-direction: column;
    align-items: center;
    display: flex;

    background-color: #282C34;
    height: 100vh;
    width: 100vw;

    font-family: Open Sans;
    font-weight: bold;
  }

  fun render : Html {
    <div::app>
      case (status) {
        Status::Initial => <div/>
        Status::Loading => <div>"Loading..."</div>

        Status::Error message =>
          <div>
            <{ message }>
          </div>

        Status::Ok data =>
          <Content value={data.message}/>
      }
    </div>
  }

  fun componentDidMount : Promise(Never, Void) {
    next {  }
  }
}
