package pl.coderslab.charity.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity;

    @ManyToMany
    private List<Category> categories;

    @ManyToOne
    private Institution institution;

    private String street;
    private String city;

    private String zipCode;

    private LocalDate pickUpDate;

    private LocalDate pickUpTime;
    private String pickUpComment;


}
