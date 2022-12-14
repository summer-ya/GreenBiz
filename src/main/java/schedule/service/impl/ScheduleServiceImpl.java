package schedule.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import schedule.dao.face.ScheduleDao;
import schedule.dto.Schedule;
import schedule.service.face.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {

   @Autowired ScheduleDao scheduleDao;
   
   @Override
   public void scheduleSave(Schedule schedule) {
      
      scheduleDao.insert(schedule);
   }

   @Override
   public List<Schedule> findAll( Map<String, Object> map) {
      return scheduleDao.selectAll(map);
   }

   @Override
   public int getScheduleNoBy(Schedule schedule) {
      return  scheduleDao.selectSchedulenoby(schedule);
   }

   @Override
   public void scheduleUpdate(Schedule upschedule) {

      scheduleDao.updateSchedule(upschedule);
      
   }

      @Override
      public int findScheduleNo(Schedule schedule) {
         return scheduleDao.findScheduleNo(schedule);
      }

      @Override
      public void deleteData(int scheduleno) {
         scheduleDao.delete(scheduleno);
         
      }

      @Override
      public boolean findAdmin(String memberno) {
         int result = scheduleDao.findAdmin(memberno);
         if( result > 0) {
            return true;
         }
         
         return false;
      }


}