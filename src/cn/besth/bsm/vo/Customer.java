package cn.besth.bsm.vo;

import java.util.HashSet;
import java.util.Set;


/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

public class Customer  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String name;
     private Integer gender;
     private String job;
     private String phone;
     private String narea;
     private String style;
     private Integer howprice;
     private Integer isbuy;
     private String remark;
     private Set records = new HashSet(0);


    // Constructors

    /** default constructor */
    public Customer() {
    }

	/** minimal constructor */
    public Customer(String name) {
        this.name = name;
    }
    
    /** full constructor */
    public Customer(String name, Integer gender, String job, String phone, String narea, String style, Integer howprice, Integer isbuy, String remark, Set records) {
        this.name = name;
        this.gender = gender;
        this.job = job;
        this.phone = phone;
        this.narea = narea;
        this.style = style;
        this.howprice = howprice;
        this.isbuy = isbuy;
        this.remark = remark;
        this.records = records;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Integer getGender() {
        return this.gender;
    }
    
    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getJob() {
        return this.job;
    }
    
    public void setJob(String job) {
        this.job = job;
    }

    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNarea() {
		return narea;
	}

	public void setNarea(String narea) {
		this.narea = narea;
	}

	public String getStyle() {
        return this.style;
    }
    
    public void setStyle(String style) {
        this.style = style;
    }

    public Integer getHowprice() {
        return this.howprice;
    }
    
    public void setHowprice(Integer howprice) {
        this.howprice = howprice;
    }

    public Integer getIsbuy() {
        return this.isbuy;
    }
    
    public void setIsbuy(Integer isbuy) {
        this.isbuy = isbuy;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Set getRecords() {
        return this.records;
    }
    
    public void setRecords(Set records) {
        this.records = records;
    }
   








}