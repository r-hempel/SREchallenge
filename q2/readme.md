## Question 2 readme
* Deploy everything using helm `helm install <release-name> .`from root-folder
* As it was a requirement to have *at least* three pod replicas, I understood this as a requirement to implement HPA. It takes some time, until the HPA scales the deployment to three replicas.
* I understood the request with the CronJob in such a way that it echoes “Hello SRE” every thirty minutes - I hope that's correct ;-)
* Resource Requests and Limits are the same to ensure Guaranteed QoS.
* To test the deployed pods you can run 
  * `helm test <release-name>` to start helm test
  * `kubectl logs test-connection` to check the logs of the test container. It should output the response from three different pods.
  * this is not the best practice for helm tests, as the tests will also succeed if wget returns nothing, but eases the verification.