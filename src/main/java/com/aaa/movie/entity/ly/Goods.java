package com.aaa.movie.entity.ly;

import java.io.Serializable;

/**
 * 
 * @author S
 * @see 商品
 */
@SuppressWarnings("serial")
public class Goods implements Serializable {
	private Integer goods_id;
	private String goods_name;
	private String goods_img;
	private Double goods_price;
	private Integer goods_num	;
	private Integer goods_status;
	public Goods() {
		super();
	}
	public Integer getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(Integer goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public Double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Double goods_price) {
		this.goods_price = goods_price;
	}
	public Integer getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(Integer goods_num) {
		this.goods_num = goods_num;
	}
	public Integer getGoods_status() {
		return goods_status;
	}
	public void setGoods_status(Integer goods_status) {
		this.goods_status = goods_status;
	}
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", goods_name=" + goods_name
				+ ", goods_img=" + goods_img + ", goods_price=" + goods_price
				+ ", goods_num=" + goods_num + ", goods_status=" + goods_status
				+ "]";
	}
	
}
