/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.urbansoul.models.controladores;

import com.mycompany.urbansoul.exceptions.NonexistentEntityException;
import com.mycompany.urbansoul.models.Usuario;
import com.mycompany.urbansoul.persistencia.UsuarioJpaController;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.List;

/**
 *
 * @author USER
 */
public class ControladorUsuario {

    private UsuarioJpaController usuJpa;

    public ControladorUsuario(EntityManagerFactory emf) {
        this.usuJpa = new UsuarioJpaController(emf);
    }

    // Create - Crear un nuevo usuario
    public void crearUsuario(Usuario usuario) {
        usuJpa.create(usuario);
    }

    // Read - Obtener todos los usuarios
    public List<Usuario> traerUsuarios() {
        return usuJpa.findUsuarioEntities();
    }

    // Read - Obtener un usuario por ID
    public Usuario buscarUsuarioPorId(Long id) {
        return usuJpa.findUsuario(id);
    }

    // Read - Buscar usuario por email
    public Usuario buscarUsuarioPorEmail(String email) {
        EntityManager em = usuJpa.getEntityManager();
        try {
            // Consulta para buscar el usuario por email
            List<Usuario> usuarios = em.createQuery("SELECT u FROM Usuario u WHERE u.email = :email", Usuario.class)
                    .setParameter("email", email)
                    .getResultList();
            // Retornar el usuario si existe, de lo contrario, devolver null
            return usuarios.isEmpty() ? null : usuarios.get(0);
        } finally {
            em.close();
        }
    }

    // Update - Actualizar un usuario existente
    public void actualizarUsuario(Usuario usuario) throws Exception {
        try {
            usuJpa.edit(usuario);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Usuario no encontrado para actualizar.");
        } catch (Exception e) {
            throw new Exception("Error al actualizar el usuario: " + e.getMessage());
        }
    }

    // Delete - Eliminar un usuario por ID
    public void eliminarUsuario(Long id) throws Exception {
        try {
            usuJpa.destroy(id);
        } catch (NonexistentEntityException e) {
            throw new Exception("Error: Usuario no encontrado para eliminar.");
        } catch (Exception e) {
            throw new Exception("Error al eliminar el usuario: " + e.getMessage());
        }
    }
}
