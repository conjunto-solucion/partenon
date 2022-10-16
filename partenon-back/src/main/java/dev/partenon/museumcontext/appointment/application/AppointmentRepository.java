package dev.partenon.museumcontext.appointment.application;

import dev.partenon.museumcontext.appointment.domain.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
        Boolean existsByAppointmentCode(String code);
}