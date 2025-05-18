package thed3er.matchsaver.model;

public enum CategoryEnum {

    MINI_ZACI("Mini žáci"),
    MLADSI_ZACI("Mladší žáci"),
    STARSI_ZACI("Starší žáci"),
    STARSI_ZACI_DOROST("Starší žáci + dorost"),
    DOROST("Dorost"),
    JUNIORI("Junioři"),
    MUZI("Muži"),
    ZENY("Ženy"),;


    public final String name;

    CategoryEnum(String categoryName) {
        this.name = categoryName;
    }
}
