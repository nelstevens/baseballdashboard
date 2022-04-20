# laod all
devtools::load_all()
postApi <- purrr::insistently(postApi)
postApi <- purrr::slowly(postApi)
# get 2021 VR offense nlb
VR21nlboff <- postApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense nlb
PL21nlboff <- postApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR def nlb
VR21nlbfld <- postApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense nlb
PL21nlbfld <- postApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR pitching nlb
VR21nlbpit <- postApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense nlb
PL21nlbpit <- postApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR offense 1l
VR21fstoff <- postApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense 1l
#PL21fstoff <- postApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 84, Round = 410, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR def 1l
VR21fstfld <- postApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense 1l
#PL21fstfld <- postApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 84, Round = 410, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR pitching 1l
VR21fstpit <- postApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 84, Round = 57, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense 1l
#PL21fstpit <- postApi("stats/Stats_Static.asmx/pit", list(Year = 2021, League = 84, Round = 410, Splits = "", IndOrTeam = "Individual"))

# get list of object
lst <- ls()[ls() != "postApi"]

# write to fst
purrr::walk(
  lst,
  function(x) fst::write_fst(base::get(x), paste0(app_sys("app/extdata"), "/", x, ".fst"))
)

