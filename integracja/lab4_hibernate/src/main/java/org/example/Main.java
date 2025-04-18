package org.example;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.print("Hello and welcome!");
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("Hibernate_JPA");
        EntityManager em = factory.createEntityManager();
        em.getTransaction().begin();

        List<Role> roles = List.of(
                new Role(null, "user"),
                new Role(null, "admin"),
                new Role(null, "developer"),
                new Role(null, "shaman"),
                new Role(null, "frog")
        );
        roles.forEach(em::persist);

        List<User> users = List.of(
                new User(null, "endriusza", "endriusza", "Andrzej", "Kowalski", Sex.MALE),
                new User(null, "skibidi", "skibidi", "Jarosław", "Skibidiński", Sex.MALE),
                new User(null, "sigma", "sigma", "Bolesława", "Sigmoid", Sex.FEMALE),
                new User(null, "tina", "tina", "Tina", "Cheese", Sex.FEMALE),
                new User(null, "lirili_larila", "lirili", "Elefante", "nel Deserto", Sex.OTHER)
        );
        users.forEach(em::persist);

        List<UsersGroup> groups = List.of(
                new UsersGroup(null, "wheel"),
                new UsersGroup(null, "adm")
        );
        groups.forEach(em::persist);

        // 4.3.2 aktualizacja hasla
        User id1 = em.find(User.class, 1L);
        id1.setPassword("new_password");
        em.merge(id1);

        // 4.3.3 usuwanie
        em.remove(em.find(User.class, 5L));

        // 4.3.4 kowalski
        Query query = em.createQuery("SELECT u FROM User u WHERE u.lastName = 'Kowalski'");
        List<User> kowalscy = query.getResultList();
        kowalscy.forEach(k -> {
            System.out.println(k.getFirstName() + " " + k.getLastName());
        });

        // 4.3.5 kobiety
        List<User> women = em.createQuery("SELECT u from User u where u.sex = 'FEMALE'").getResultList();
        women.forEach( w ->
                System.out.println(w.getFirstName() + " " + w.getLastName())
        );

        // 4.4.4 new user + 2 role
        User newUser = new User(null, "hatsume_miku", "hatsune_miku", "Hatsune", "Miku", Sex.OTHER);
        newUser.addRole(roles.getFirst());
        newUser.addRole(roles.getLast());
        em.persist(newUser);

        // 4.4.5 users group
        newUser.addGroup(groups.getFirst());
        newUser.addGroup(groups.get(1));
        em.merge(newUser);

        id1.addGroup(groups.get(0));
        id1.addGroup(groups.get(1));
        em.merge(id1);

        // 4.5.2 zapis danych binarnych
        try {
            Path imgPath = Paths.get("src/main/resources/hatsune_miku.png");
            byte[] img = Files.readAllBytes(imgPath);
            newUser.setImage(img);
            em.merge(newUser);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        em.getTransaction().commit();
        em.close();
        factory.close();
    }
}