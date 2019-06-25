# secure-log
Recently I have to work out a solution for logging information in my Phoenix application.

 

I have some PHI information going in and out of my API Servers written in Elixir, using Phoenix.

I want to log those information for both operational purposes and debugging purposes.

 

For operational purposes, I have an extremely secured private server to store PHI, with all the necessary encryption/decryption, and only a few authorized people can access. The PHI information can be stored at they are, at-rest encrypted, of course.

 

For debugging purposes, I use one secured server that allow all the software engineers and qa personnel to access. The PHI information will be masked for this server, so no original information can be found, what soever. For example %User{ first_name: “*****”, last_name: “****”}
There is no way to convert back ***** to real information. So everybody can have a look at those information.

 

Here are the requirements:

1-    Retain as much as possible the Logger calls in the code. We have a lot of Logger calls in the code, so ideally we should have to change only minimum log calls that log the PHI information. The other calls must just work.

2-    For each of the call to the Logger, for example Logger.debug(“Call list_user:” … whatever users list from database here), it must do the following things:
- Log to the extremely secured PHI log server, send only information that is PHI, so we don’t redundantly write Non-PHI information there.
- Log to the Non-PHI log server: All non-phi information is stored as they are, and all the phi information is stored with phi data masked as “*”

3-    All the current logger backends, for example: :console, LoggerFileBackend should still work with no modification, and they must log non-phi data, phi-data securely, meaning no real PHI data can be printed to those existing logger backends.

4-    When people add more Logger backends to log to different services, for example Timber or Spark, it must be incorporated in to PHI – Non PHI tasks seamlessly. If they misconfigure the logger, the PHI information should not go there unmasked. And the existing calls to Logger in the current application code must not be changed.

5-    When software engineers call the Logger.info, Logger.debug, Logger.error in the code, the PHI information cannot be accidentally leaked.
For example some existing code or new code like this: Logger.error(“Error updating user: #{inspect(user)}) will automatically print the masked version of data to log, instead of the original.  

 

Considering all those requirements, you can see it is not an easy one. It also explains why in many cases, companies leaked username, password, credit cards and other confidential informations all over the places, even when they encrypted information in the database. They forgot about the network transportations and logging at many levels of complex systems.

 

It took me quite a few days to complete the whole solution that satisfied all the requirements above.
