class Tag {
    String title;
    String value;

    Tag({
        this.title,
        this.value,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => new Tag(
        title: json["TITLE"],
        value: json["VALUE"] == null ? null : json["VALUE"],
    );

    Map<String, dynamic> toJson() => {
        "TITLE": title,
        "VALUE": value == null ? null : value,
    };
}