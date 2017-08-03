package cn.besth.bsm.vo;

import java.util.HashSet;
import java.util.Set;


/**
 * Room entity. @author MyEclipse Persistence Tools
 */

public class Room  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Build build;
     private String name;
     private Integer type;
     private Integer direction;
     private Integer style;
     private Float parea;
     private Float oarea;
     private Float tarea;
     private Float price;
     private Integer state;
     private Set records = new HashSet(0);

     
     public String getAllName(){
    	 return build.getAllName()+name;
     }
     
    // Constructors

    /** default constructor */
    public Room() {
    }

    
    /** full constructor */
    public Room(Build build, String name, Integer type, Integer direction, Integer style, Float parea, Float oarea, Float tarea, Float price, Integer state, Set records) {
        this.build = build;
        this.name = name;
        this.type = type;
        this.direction = direction;
        this.style = style;
        this.parea = parea;
        this.oarea = oarea;
        this.tarea = tarea;
        this.price = price;
        this.state = state;
        this.records = records;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Build getBuild() {
        return this.build;
    }
    
    public void setBuild(Build build) {
        this.build = build;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Integer getDirection() {
		return direction;
	}


	public void setDirection(Integer direction) {
		this.direction = direction;
	}


	public Integer getStyle() {
		return style;
	}


	public void setStyle(Integer style) {
		this.style = style;
	}


	public Float getParea() {
        return this.parea;
    }
    
    public void setParea(Float parea) {
        this.parea = parea;
    }

    public Float getOarea() {
        return this.oarea;
    }
    
    public void setOarea(Float oarea) {
        this.oarea = oarea;
    }

    public Float getTarea() {
        return this.tarea;
    }
    
    public void setTarea(Float tarea) {
        this.tarea = tarea;
    }

    public Float getPrice() {
        return this.price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getState() {
        return this.state;
    }
    
    public void setState(Integer state) {
        this.state = state;
    }

    public Set getRecords() {
        return this.records;
    }
    
    public void setRecords(Set records) {
        this.records = records;
    }
   








}