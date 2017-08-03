package cn.besth.bsm.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * House entity. @author MyEclipse Persistence Tools
 */

public class House  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String name;
     private String position;
     private Float parea;
     private Float barea;
     private Float rarea;
     private Float garea;
     private Integer sum;
     private Date cdate;
     private String remark;
     private Set builds = new HashSet(0);
     
     public String getCdateStr(){
    	 if (cdate!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(cdate);
		}
    	return "";
     }

    // Constructors

    /** default constructor */
    public House() {
    }

    
    /** full constructor */
    public House(String name, String position, Float parea, Float barea, Float rarea, Float garea, Integer sum, String remark, Set builds) {
        this.name = name;
        this.position = position;
        this.parea = parea;
        this.barea = barea;
        this.rarea = rarea;
        this.garea = garea;
        this.sum = sum;
        this.remark = remark;
        this.builds = builds;
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

    public String getPosition() {
        return this.position;
    }
    
    public void setPosition(String position) {
        this.position = position;
    }

    public Float getParea() {
        return this.parea;
    }
    
    public void setParea(Float parea) {
        this.parea = parea;
    }

    public Float getBarea() {
        return this.barea;
    }
    
    public void setBarea(Float barea) {
        this.barea = barea;
    }

    public Float getRarea() {
        return this.rarea;
    }
    
    public void setRarea(Float rarea) {
        this.rarea = rarea;
    }

    public Float getGarea() {
        return this.garea;
    }
    
    public void setGarea(Float garea) {
        this.garea = garea;
    }

    public Integer getSum() {
        return this.sum;
    }
    
    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Date getCdate() {
		return cdate;
	}


	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}


	public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Set getBuilds() {
        return this.builds;
    }
    
    public void setBuilds(Set builds) {
        this.builds = builds;
    }
   








}