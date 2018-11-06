package com.cityfarmer.repository.domain.tip;

import lombok.Data;

@Data
public class TFormVO {
private String writer;
private String tipTitle;
private String tipContent;
private String fileUrl;
private String oriName;
private String sysName;
private String path;
private int size;
}
