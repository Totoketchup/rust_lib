use time::{self, Tm};
pub fn get_time_now() -> Tm {
    time::now()
}