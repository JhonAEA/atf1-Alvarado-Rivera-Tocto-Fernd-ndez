/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.urbansoul.persistencia;

import java.io.Serializable;
import jakarta.persistence.Query;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import com.mycompany.urbansoul.models.DetalleVenta;
import com.mycompany.urbansoul.models.Venta;
import com.mycompany.urbansoul.persistencia.exceptions.IllegalOrphanException;
import com.mycompany.urbansoul.persistencia.exceptions.NonexistentEntityException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class VentaJpaController implements Serializable {

    public VentaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Venta venta) {
        if (venta.getDetalles() == null) {
            venta.setDetalles(new ArrayList<DetalleVenta>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<DetalleVenta> attachedDetalles = new ArrayList<DetalleVenta>();
            for (DetalleVenta detallesDetalleVentaToAttach : venta.getDetalles()) {
                detallesDetalleVentaToAttach = em.getReference(detallesDetalleVentaToAttach.getClass(), detallesDetalleVentaToAttach.getIdDetalleVenta());
                attachedDetalles.add(detallesDetalleVentaToAttach);
            }
            venta.setDetalles(attachedDetalles);
            em.persist(venta);
            for (DetalleVenta detallesDetalleVenta : venta.getDetalles()) {
                Venta oldVentaOfDetallesDetalleVenta = detallesDetalleVenta.getVenta();
                detallesDetalleVenta.setVenta(venta);
                detallesDetalleVenta = em.merge(detallesDetalleVenta);
                if (oldVentaOfDetallesDetalleVenta != null) {
                    oldVentaOfDetallesDetalleVenta.getDetalles().remove(detallesDetalleVenta);
                    oldVentaOfDetallesDetalleVenta = em.merge(oldVentaOfDetallesDetalleVenta);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Venta venta) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta persistentVenta = em.find(Venta.class, venta.getIdVenta());
            List<DetalleVenta> detallesOld = persistentVenta.getDetalles();
            List<DetalleVenta> detallesNew = venta.getDetalles();
            List<String> illegalOrphanMessages = null;
            for (DetalleVenta detallesOldDetalleVenta : detallesOld) {
                if (!detallesNew.contains(detallesOldDetalleVenta)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain DetalleVenta " + detallesOldDetalleVenta + " since its venta field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<DetalleVenta> attachedDetallesNew = new ArrayList<DetalleVenta>();
            for (DetalleVenta detallesNewDetalleVentaToAttach : detallesNew) {
                detallesNewDetalleVentaToAttach = em.getReference(detallesNewDetalleVentaToAttach.getClass(), detallesNewDetalleVentaToAttach.getIdDetalleVenta());
                attachedDetallesNew.add(detallesNewDetalleVentaToAttach);
            }
            detallesNew = attachedDetallesNew;
            venta.setDetalles(detallesNew);
            venta = em.merge(venta);
            for (DetalleVenta detallesNewDetalleVenta : detallesNew) {
                if (!detallesOld.contains(detallesNewDetalleVenta)) {
                    Venta oldVentaOfDetallesNewDetalleVenta = detallesNewDetalleVenta.getVenta();
                    detallesNewDetalleVenta.setVenta(venta);
                    detallesNewDetalleVenta = em.merge(detallesNewDetalleVenta);
                    if (oldVentaOfDetallesNewDetalleVenta != null && !oldVentaOfDetallesNewDetalleVenta.equals(venta)) {
                        oldVentaOfDetallesNewDetalleVenta.getDetalles().remove(detallesNewDetalleVenta);
                        oldVentaOfDetallesNewDetalleVenta = em.merge(oldVentaOfDetallesNewDetalleVenta);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = venta.getIdVenta();
                if (findVenta(id) == null) {
                    throw new NonexistentEntityException("The venta with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta venta;
            try {
                venta = em.getReference(Venta.class, id);
                venta.getIdVenta();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The venta with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<DetalleVenta> detallesOrphanCheck = venta.getDetalles();
            for (DetalleVenta detallesOrphanCheckDetalleVenta : detallesOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Venta (" + venta + ") cannot be destroyed since the DetalleVenta " + detallesOrphanCheckDetalleVenta + " in its detalles field has a non-nullable venta field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(venta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Venta> findVentaEntities() {
        return findVentaEntities(true, -1, -1);
    }

    public List<Venta> findVentaEntities(int maxResults, int firstResult) {
        return findVentaEntities(false, maxResults, firstResult);
    }

    private List<Venta> findVentaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Venta.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Venta findVenta(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Venta.class, id);
        } finally {
            em.close();
        }
    }

    public int getVentaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Venta> rt = cq.from(Venta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
