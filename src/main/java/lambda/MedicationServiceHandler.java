package lambda;

import com.amazonaws.services.lambda.runtime.Context;

public class MedicationServiceHandler {

    public String handleRequest(Object request, Context context) {
        System.out.println("~~~~~~~~~~~~~~~ START ~~~~~~~~~~~~~~~~");
        System.out.println("Hello Lambda!");
        System.out.println("REQUEST: " + request);
        System.out.println("~~~~~~~~~~~~~~~ FINISH ~~~~~~~~~~~~~~~~");
        return "Round-a-bitch";
    }
}
