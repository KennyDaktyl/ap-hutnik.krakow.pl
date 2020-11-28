import datetime
import redis
from django.conf import settings
r = redis.StrictRedis(host=settings.REDIS_HOST,
                      port=settings.REDIS_PORT,
                      db=settings.REDIS_DB)


def get_utc_date_now():
        return datetime.datetime.utcnow().date()

def get_daily_counter(r, dt_key='dt', counter_key='counter'):
    
    def incr_daily_number(pipe):
        dt_now = get_utc_date_now().isoformat()  # e.g.: "2014-10-18"
        # dt_now="2014-10-18"
        dt = str(pipe.get(dt_key))    
        pipe.multi()    
        dt=dt.replace("b'","").replace("'","")
        if dt != dt_now:
            pipe.set(dt_key, dt_now)
            pipe.set(counter_key, 0)
        pipe.get(dt_key)
        pipe.incr(counter_key)
    result = r.transaction(incr_daily_number, dt_key)
    return result[-2:]