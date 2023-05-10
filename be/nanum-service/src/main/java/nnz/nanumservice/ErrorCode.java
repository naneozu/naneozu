package nnz.nanumservice;


import io.github.eello.nnz.common.exception.AbstractErrorCode;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.NOT_FOUND;

@RequiredArgsConstructor
public enum ErrorCode implements AbstractErrorCode {

    USER_NOT_FOUND("U009", "등록되지 않은 사용자입니다.", NOT_FOUND),
    SHOW_NOT_FOUND("S001", "등록되지 않은 공연입니다.", NOT_FOUND),
    CATEGORY_NOT_FOUND("C001", "등록되지 않은 카테고리입니다.", NOT_FOUND),
    NANUM_NOT_FOUND("N001", "등록되지 않은 나눔입니다.", NOT_FOUND),
    USER_NANUM_NOT_FOUND("UN002", "등록되지 않은 받은 나눔입니다.", NOT_FOUND),

    ;

    private final String code;
    private final String message;
    private final HttpStatus status;

    @Override
    public String getCode() {
        return this.code;
    }

    @Override
    public String getMessage() {
        return this.message;
    }

    @Override
    public HttpStatus getStatus() {
        return this.status;
    }

}
