# laod all
devtools::load_all()

# get 2021 VR offense
VR21off <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense
PL21off <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR def
VR21fld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense
PL21fld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR pitching
VR21pit <- getApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense
PL21pit <- getApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get list of object
lst <- ls()

# write to fst
purrr::walk(
  lst,
  function(x) fst::write_fst(base::get(x), paste0(app_sys("app/extdata"), "/", x, ".fst"))
)

