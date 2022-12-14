package schedule.dao.face;

import java.util.List;
import java.util.Map;

import schedule.dto.Schedule;

public interface ScheduleDao {

   public void insert(Schedule schedule);

   public List<Schedule> selectAll(Map<String, Object> map);

   public int selectSchedulenoby(Schedule schedule);

   public void updateSchedule(Schedule upschedule);


   public int findScheduleNo(Schedule schedule);

   public void delete(int scheduleno);
   
   public int findAdmin(String memberno);
}