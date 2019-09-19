# Calendar
Test Calendar Project 

Standard Calendar using a UICollectionView. Populates custom cells based off the current Date().
Cell text labels/ dates are the indexPath of the cell, minus the amount of days at the beginning of the week before the 1st of the month. 
didSelectItemAtIndexPath converts the text label of the cell to an actual Date object, then sends that date to a new ViewController.
