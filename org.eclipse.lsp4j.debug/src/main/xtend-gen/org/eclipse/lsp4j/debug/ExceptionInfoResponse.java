/**
 * Copyright (c) 2017 Kichwa Coders Ltd. and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 */
package org.eclipse.lsp4j.debug;

import org.eclipse.lsp4j.debug.ExceptionBreakMode;
import org.eclipse.lsp4j.debug.ExceptionDetails;
import org.eclipse.xtext.xbase.lib.Pure;
import org.eclipse.xtext.xbase.lib.util.ToStringBuilder;

/**
 * Response to 'exceptionInfo' request.
 */
@SuppressWarnings("all")
public class ExceptionInfoResponse {
  /**
   * ID of the exception that was thrown.
   */
  private String exceptionId;
  
  /**
   * Descriptive text for the exception provided by the debug adapter.
   * <p>
   * This is an optional property.
   */
  private String description;
  
  /**
   * Mode that caused the exception notification to be raised.
   */
  private ExceptionBreakMode breakMode;
  
  /**
   * Detailed information about the exception.
   * <p>
   * This is an optional property.
   */
  private ExceptionDetails details;
  
  /**
   * ID of the exception that was thrown.
   */
  @Pure
  public String getExceptionId() {
    return this.exceptionId;
  }
  
  /**
   * ID of the exception that was thrown.
   */
  public void setExceptionId(final String exceptionId) {
    this.exceptionId = exceptionId;
  }
  
  /**
   * Descriptive text for the exception provided by the debug adapter.
   * <p>
   * This is an optional property.
   */
  @Pure
  public String getDescription() {
    return this.description;
  }
  
  /**
   * Descriptive text for the exception provided by the debug adapter.
   * <p>
   * This is an optional property.
   */
  public void setDescription(final String description) {
    this.description = description;
  }
  
  /**
   * Mode that caused the exception notification to be raised.
   */
  @Pure
  public ExceptionBreakMode getBreakMode() {
    return this.breakMode;
  }
  
  /**
   * Mode that caused the exception notification to be raised.
   */
  public void setBreakMode(final ExceptionBreakMode breakMode) {
    this.breakMode = breakMode;
  }
  
  /**
   * Detailed information about the exception.
   * <p>
   * This is an optional property.
   */
  @Pure
  public ExceptionDetails getDetails() {
    return this.details;
  }
  
  /**
   * Detailed information about the exception.
   * <p>
   * This is an optional property.
   */
  public void setDetails(final ExceptionDetails details) {
    this.details = details;
  }
  
  @Override
  @Pure
  public String toString() {
    ToStringBuilder b = new ToStringBuilder(this);
    b.add("exceptionId", this.exceptionId);
    b.add("description", this.description);
    b.add("breakMode", this.breakMode);
    b.add("details", this.details);
    return b.toString();
  }
  
  @Override
  @Pure
  public boolean equals(final Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    ExceptionInfoResponse other = (ExceptionInfoResponse) obj;
    if (this.exceptionId == null) {
      if (other.exceptionId != null)
        return false;
    } else if (!this.exceptionId.equals(other.exceptionId))
      return false;
    if (this.description == null) {
      if (other.description != null)
        return false;
    } else if (!this.description.equals(other.description))
      return false;
    if (this.breakMode == null) {
      if (other.breakMode != null)
        return false;
    } else if (!this.breakMode.equals(other.breakMode))
      return false;
    if (this.details == null) {
      if (other.details != null)
        return false;
    } else if (!this.details.equals(other.details))
      return false;
    return true;
  }
  
  @Override
  @Pure
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + ((this.exceptionId== null) ? 0 : this.exceptionId.hashCode());
    result = prime * result + ((this.description== null) ? 0 : this.description.hashCode());
    result = prime * result + ((this.breakMode== null) ? 0 : this.breakMode.hashCode());
    result = prime * result + ((this.details== null) ? 0 : this.details.hashCode());
    return result;
  }
}
