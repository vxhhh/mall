package com.pyk.configuration;

import lombok.Data;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
@Data
public class NotValidR {
    private String code;
    private String Msg;

    @ResponseBody
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public NotValidR notValidR(MethodArgumentNotValidException e)
    {
        NotValidR notValid = new NotValidR();
        notValid.setCode("400");
        notValid.setMsg(e.getBindingResult().getFieldError().getDefaultMessage());
        return notValid;
    }

}