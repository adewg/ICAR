# Schema Type: icarDateTimeType

An ICAR date time type is a string, formatted and validated using the RFC3339 subset of the ISO 8601 specification.
There is more documentation for this format at https://ijmacd.github.io/

For ICAR data exchange purposes, this should be a string in the format YYYY-MM-DDTHH:MM:SS.XXXZ - that is, it should be a complete date and time in UTC (the Z specifier at the end indicates UTC or Zulu time). You SHOULD convert from local time to UTC time.

If local time is used instead (allowed but not recommended), the Z should be left off and a +HH appended to represent the time offset of local time from UTC. For instance, a local time in East Australian winter time would have +10 at the end.

## Examples

* 2021-11-26T15:30:00.000Z  - 3:30pm UTC time on the 26th November 2021.
