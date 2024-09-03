# -*- encoding : utf-8 -*-
# Add a callback - to be executed before each request in development,
# and at startup in production - to patch existing app classes.
# Doing so in init/environment.rb wouldn't work in development, since
# classes are reloaded, but initialization is not run each time.
# See http://stackoverflow.com/questions/7072758/plugin-not-reloading-in-development-mode
#
Rails.configuration.to_prepare do

  # Example of adding a default text to each message
  OutgoingMessage.class_eval do
  #   # Add intro paragraph to new request template
  def default_letter
  #     # this line allows the default_letter text added by this
  #     # method to be replaced by the value supplied by the API
  #     # e.g. http://demo.alaveteli.org/new/tgq?default_letter=this+is+a+test
  return @default_letter if @default_letter
  return nil if self.message_type == 'followup'
  "Please accept this electronic request for public records made under OPRA and the common law right of access.  I am not required to fill out an official form or use a particular software platform to submit my request per NJSA 47:1A-6(f), which states that an email from a requestor including all of the information required on the adopted form shall suffice in place of a completed form as a valid government record request.

I HAVE NOT been convicted of any indictable offense under the laws of New Jersey, any other state, or the United States.

I WILL NOT use the requested government records for a commercial purpose.

I AM NOT seeking records in connection with a legal proceeding.

Records requested:



My preferred delivery method for response(s) to this request is by E-mail as attachments.  Please confirm you have received this request.  If you are not the custodian of records, please forward my request to that person and provide their email address to me for future reference."
  end
 end
end

ReplyToAddressValidator.invalid_reply_addresses = %w(pqg@buyinportugal.pt partner@mpromo.az JohnAllen1949@aol.com)
