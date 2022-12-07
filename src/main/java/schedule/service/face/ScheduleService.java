package schedule.service.face;

import java.util.List;

import schedule.dto.Schedule;


public interface ScheduleService {

   public void scheduleSave(Schedule schedule);

   public List<Schedule> findAll();

   public int getScheduleNoBy(Schedule schedule);

   public void scheduleUpdate(Schedule upschedule);
   
      public int findScheduleNo(Schedule schedule);

      public void deleteData(int scheduleno);

      public boolean findAdmin(String memberno);

}