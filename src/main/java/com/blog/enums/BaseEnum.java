package com.blog.enums;

/**
 * Create 2017/11/17
 */
public interface BaseEnum<E extends Enum<E>,V extends Object> {
    V getValue();
    String getText();
}