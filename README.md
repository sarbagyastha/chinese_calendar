# Chinese Calendar

This project demonstrates that the **Calendar Delegate** [proposed in this PR](https://github.com/flutter/flutter/pull/161874) can effectively handle variable-month calendar systems, such as the traditional Chinese calendar.

## Overview

The traditional Chinese calendar is a **lunisolar calendar**, meaning its months are based on the moon's cycles while aligning with the solar year.
Unlike the **Gregorian calendar**, which has fixed months, the Chinese calendar varies in month lengths and occasionally includes a **leap month** to synchronize with the solar year.

This project showcases how the **Calendar Delegate** can adapt to such variations, making it a robust solution for implementing non-Gregorian calendars in Flutter. 
The project uses the [Lunar](https://pub.dev/packages/lunar) package to handle the specifics of the Chinese lunisolar calendar.


## Related Links

- **Flutter Calendar Delegate Proposal:** [PR #161874](https://github.com/flutter/flutter/pull/161874)
- **Lunisolar Calendars Explained:** [Wikipedia](https://en.wikipedia.org/wiki/Lunisolar_calendar)
