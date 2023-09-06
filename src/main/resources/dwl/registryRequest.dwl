%dw 2.0
output application/json
---
payload map{
    "EntityType": $.party[0].partyType,
    "FirstName": $.party[0].firstName,
    "LastName": $.party[0].lastName,
    "DOB": $.party[0].birthDate,
    "System": flatten(($.externalIds filter ($.externalIdType contains "FIS")).externalIdType)[0],
    "SystemID": flatten(($.externalIds filter ($.externalIdType contains "FIS")).externalId)[0],
    "SSN_Tax": $.taxIdentificationNumber,
    "Phone1": flatten(($.party[0].contactPoints filter ($.contactPointType contains "ContactPointPhone")).telephoneNumber1)[0],
    "Phone2": flatten(($.party[0].contactPoints filter ($.contactPointType contains "ContactPointPhone")).telephoneNumber2)[0],
    "Phone3": flatten(($.party[0].contactPoints filter ($.contactPointType contains "ContactPointPhone")).telephoneNumber3)[0],
    "Email": flatten(($.party[0].contactPoints filter ($.contactPointType contains "ContactPointEmail")).emailAddress)[0]

}