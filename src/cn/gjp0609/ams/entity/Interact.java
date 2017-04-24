package cn.gjp0609.ams.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * ID * TITLE * DETAILS * STATUS * CREATE_DATE * ANSWER * ANSWER_DATE * SID * TID
 * Created by gjp06 on 17.4.24.
 */
public class Interact implements Serializable {
    private Integer id;
    private String title;
    private String details;
    private String status;
    private Date createDate;
    private String answer;
    private Date answerDate;
    private User student;
    private User teacher;

    @Override
    public String toString() {
        return "Interact{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", details='" + details + '\'' +
                ", status='" + status + '\'' +
                ", createDate=" + createDate +
                ", answer='" + answer + '\'' +
                ", answerDate=" + answerDate +
                ", student=" + student +
                ", teacher=" + teacher +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getAnswerDate() {
        return answerDate;
    }

    public void setAnswerDate(Date answerDate) {
        this.answerDate = answerDate;
    }

    public User getStudent() {
        return student;
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }
}
