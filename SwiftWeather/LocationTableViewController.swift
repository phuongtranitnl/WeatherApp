//
//  LocationTableViewController.swift
//  SwiftWeather
//
//  Created by CNTT-MAC on 12/29/18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController {
    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLoacations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierCell = "LocationTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as? LocationTableViewCell else {
            fatalError("Can not get the location!")
        }
        let location = locations[indexPath.row]
        
        cell.weatherLocation.text = location.weatherLocation
        cell.weatherStatus.text = location.weatherStatus
        cell.weatherTemperature.text = location.weatherTemperature
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func loadLoacations() {
        guard let location = Location.init (weatherLocation: "Bình Thuận", weatherStatus: "Âm U Mù Mịt", weatherTemperature: "20°C") else {
            fatalError("Can not load the meal")
        }
        locations += [location]
    }
    
    
}
