package org.example;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users_group")
public class UsersGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToMany(mappedBy = "groups")
    private Set<User> users = new HashSet<>();

    UsersGroup(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public UsersGroup() {}

    public void addUser(User user) {
        users.add(user);
    }
}
