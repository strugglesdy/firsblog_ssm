package com.blog.enums.common;

import com.blog.enums.BaseEnum;

/**
 * 删除枚举
 * Create 2017/11/17
 */
public enum IsDeleted implements BaseEnum<IsDeleted, Integer> {
    /**
     * 正常
     */
    NO(0, "正常"),
    /**
     * 删除
     */
    YES(1, "删除");

    IsDeleted(int value, String text) {
        this.value = value;
        this.text = text;
    }

    private int value;
    private String text;

    @Override
    public Integer getValue() {
        return value;
    }

    @Override
    public String getText() {
        return text;
    }
}
