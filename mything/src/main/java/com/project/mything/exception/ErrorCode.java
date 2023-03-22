package com.project.mything.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

import static org.springframework.http.HttpStatus.*;

@Getter
@AllArgsConstructor
public enum ErrorCode {
    NO_MATCH_AUTH_NUMBER(CONFLICT),
    NO_MATCH_PHONE_NUMBER(CONFLICT),
    INVALID_PHONE_NUMBER(BAD_REQUEST),
    USER_NOT_FOUND(NOT_FOUND),
    ITEM_EXISTS(CONFLICT),
    ITEM_NOT_FOUND(NOT_FOUND),
    USER_NOT_MATCH(FORBIDDEN),
    ITEM_STATUS_NOT_RESERVE(CONFLICT),
    ITEM_ALREADY_RESERVED(CONFLICT),
    RESERVE_USER_CONFLICT(CONFLICT),
    ITEM_STATUS_NOT_POST(CONFLICT),
    POST_NOT_ALLOW(CONFLICT),
    S3_SERVICE_ERROR(INTERNAL_SERVER_ERROR),
    AVATAR_MUST_NOT_NULL(CONFLICT),
    APPLY_NOT_FOUND(NOT_FOUND),
    Apply_STATUS_REJECT(CONFLICT),
    ITEM_STATUS_CONFLICT(CONFLICT),
    JWT_UNAUTHORIZED(UNAUTHORIZED),
    NO_CORRECT_ACCOUNT(CONFLICT),
    INVALID_ACCESS(FORBIDDEN),
    IMAGE_NOT_FOUND(NOT_FOUND),
    EMAIL_ALREADY_EXIST(CONFLICT),
    PHONE_ALREADY_EXIST(CONFLICT),
    APPLY_SENDER_CONFLICT(CONFLICT),
    APPLY_RECEIVER_CONFLICT(CONFLICT);

    private HttpStatus httpStatus;


}
