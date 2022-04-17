# laod all
devtools::load_all()

# get 2021 VR offense nlb
VR21nlboff <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense nlb
PL21nlboff <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR def nlb
VR21nlbfld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense nlb
PL21nlbfld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR pitching nlb
VR21nlbpit <- getApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense nlb
PL21nlbpit <- getApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR offense 1l
VR21fstoff <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense 1l
PL21fstoff <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 84, Round = 410, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR def 1l
VR21fstfld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense 1l
PL21fstfld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 84, Round = 410, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR pitching 1l
VR21fstpit <- getApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense 1l
PL21fstpit <- getApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 84, Round = 410, Splits = "", IndOrTeam = "Individual"))

# get list of object
lst <- ls()

# write to fst
purrr::walk(
  lst,
  function(x) fst::write_fst(base::get(x), paste0(app_sys("app/extdata"), "/", x, ".fst"))
)

